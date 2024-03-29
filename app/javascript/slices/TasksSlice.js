import { propEq } from 'ramda';
import { createSlice } from '@reduxjs/toolkit';
import { useDispatch } from 'react-redux';
import { changeColumn } from '@asseinfo/react-kanban'; /* а где он был раньше? */

import TasksRepository from 'repositories/TasksRepository';
import TaskPresenter, { STATES } from 'presenters/TaskPresenter';

import TaskForm from 'forms/TaskForm';

const initialState = {
  board: {
    columns: STATES.map((column) => ({
      id: column.key,
      title: column.value,
      cards: [],
      meta: {},
    })),
  },
};

const tasksSlice = createSlice({
  name: 'tasks',
  initialState,
  reducers: {
    loadColumnSuccess(state, { payload }) {
      const { items, meta, columnId } = payload;
      const column = state.board.columns.find(propEq('id', columnId));

      state.board = changeColumn(state.board, column, {
        cards: items,
        meta,
      });

      return state;
    },

    loadColumnMoreSuccess(state, { payload }) {
      const { items, meta, columnId } = payload;
      const column = state.board.columns.find(propEq('id', columnId));

      state.board = changeColumn(state.board, column, {
        cards: [...column.cards, ...items],
        meta,
      });

      return state;
    },
  },
});

const { loadColumnSuccess, loadColumnMoreSuccess } = tasksSlice.actions;

export default tasksSlice.reducer;

export const useTasksActions = () => {
  const dispatch = useDispatch();

  const loadColumn = (state, page = 1, perPage = 10) =>
    TasksRepository.index({
      q: { stateEq: state },
      page,
      perPage,
    }).then(({ data }) => {
      dispatch(loadColumnSuccess({ ...data, columnId: state }));
    });

  const loadBoard = () => STATES.map(({ key }) => loadColumn(key));

  const loadColumnMore = (state, page = 1, perPage = 10) =>
    TasksRepository.index({
      q: { stateEq: state },
      page,
      perPage,
    }).then(({ data }) => {
      dispatch(loadColumnMoreSuccess({ ...data, columnId: state }));
    });

  const loadTask = (id) =>
    TasksRepository.show(id).then(({ data: { task } }) => task);

  const updateTask = (task) => {
    const attributes = TaskForm.attributesToSubmit(task);

    return TasksRepository.update(TaskPresenter.id(task), attributes).then(
      () => {
        loadColumn(TaskPresenter.state(task));
      },
    );
  };

  const createTask = (params) => {
    const attributes = TaskForm.attributesToSubmit(params);

    return TasksRepository.create(attributes).then(({ data: { task } }) => {
      loadColumn(TaskPresenter.state(task));
    });
  };

  const destroyTask = (task) =>
    TasksRepository.destroy(TaskPresenter.id(task)).then(() => {
      loadColumn(TaskPresenter.state(task));
    });

  const dragEndTask = (task, source, destination) => {
    const transition = TaskPresenter.transitions(task).find(
      ({ to }) => destination.toColumnId === to,
    );
    if (!transition) {
      return null;
    }

    return TasksRepository.update(TaskPresenter.id(task), {
      stateEvent: transition.event,
    })
      .then(() => {
        loadColumn(destination.toColumnId);
        loadColumn(source.fromColumnId);
      })
      .catch((error) => {
        // eslint-disable-next-line no-alert
        alert(`Move failed! ${error.message}`);
      });
  };

  return {
    loadColumn,
    loadBoard,
    loadColumnMore,
    loadTask,
    updateTask,
    createTask,
    destroyTask,
    dragEndTask,
  };
};
