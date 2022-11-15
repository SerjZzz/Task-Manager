import { useSelector } from 'react-redux';
import { useTasksActions } from 'slices/TasksSlice';
import { STATES } from 'presenters/TaskPresenter';

const useTasks = () => {
  const board = useSelector((state) => state.TasksSlice.board);
  const {
    loadColumn,
    loadColumnMore,
    loadTask,
    updateTask,
    createTask,
    destroyTask,
    dragEndTask,
  } = useTasksActions();

  const loadBoard = () => Promise.all(STATES.map(({ key }) => loadColumn(key)));

  return {
    board,
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

export default useTasks;
