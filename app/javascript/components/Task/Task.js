import React from 'react';
import PropTypes from 'prop-types';

import TaskPresenter from 'presenters/TaskPresenter';

import {
  Card,
  CardHeader,
  IconButton,
  CardContent,
  Typography,
} from '@material-ui/core/';
import EditIcon from '@material-ui/icons/Edit';
import useStyles from './useStyles';

function Task({ task, onClick }) {
  const handleClick = () => onClick(task);
  const styles = useStyles();

  const action = (
    <IconButton onClick={handleClick}>
      <EditIcon />
    </IconButton>
  );

  return (
    <Card className={styles.root}>
      <CardHeader title={TaskPresenter.name(task)} action={action} />
      <CardContent>
        <Typography variant="body2" color="textSecondary" component="p">
          {TaskPresenter.description(task)}
        </Typography>
      </CardContent>
    </Card>
  );
}

Task.propTypes = {
  task: TaskPresenter.shape().isRequired,
  onClick: PropTypes.func.isRequired,
};

export default Task;
