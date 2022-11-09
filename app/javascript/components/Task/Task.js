import React from 'react';
import PropTypes from 'prop-types';

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
      <CardHeader title={task.name} action={action} />
      <CardContent>
        <Typography variant="body2" color="textSecondary" component="p">
          {task.description}
        </Typography>
      </CardContent>
    </Card>
  );
}

Task.propTypes = {
  task: PropTypes.shape({
    id: PropTypes.number.isRequired,
    name: PropTypes.string.isRequired,
    description: PropTypes.string.isRequired,
    author: PropTypes.shape().isRequired,
    assignee: PropTypes.shape(),
    state: PropTypes.string.isRequired,
  }).isRequired,
  onClick: PropTypes.func.isRequired,
};

export default Task;
