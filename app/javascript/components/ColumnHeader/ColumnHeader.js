import React, { useState } from 'react';
import PropTypes from 'prop-types';

import IconButton from '@material-ui/core/IconButton';
import SystemUpdateAltIcon from '@material-ui/icons/SystemUpdateAlt';

import useStyles from './useStyles';

function ColumnHeader({ column, onLoadMore }) {
  const styles = useStyles();

  const [loading, setLoading] = useState(false);

  const {
    id,
    title,
    cards,
    meta: { totalCount, currentPage, totalPages },
  } = column;

  const count = cards.length;

  const handleLoadMore = () => {
    setLoading(true);

    onLoadMore(id, currentPage + 1).then(() => {
      setLoading(false);
    });
  };

  return (
    <div className={styles.root}>
      <div className={styles.title}>
        <b>{title}</b> ({count}/{totalCount || '…'})
      </div>
      <div className={styles.actions}>
        {currentPage < totalPages && (
          <IconButton
            aria-label="Load more"
            disabled={loading}
            onClick={() => handleLoadMore()}
          >
            <SystemUpdateAltIcon fontSize="small" />
          </IconButton>
        )}
      </div>
    </div>
  );
}

ColumnHeader.propTypes = {
  column: PropTypes.shape({
    id: PropTypes.string.isRequired,
    title: PropTypes.string.isRequired,
    cards: PropTypes.oneOfType([
      PropTypes.objectOf(PropTypes.shape()),
      PropTypes.arrayOf(PropTypes.shape()),
    ]).isRequired,
    meta: PropTypes.shape({
      totalCount: PropTypes.number,
      currentPage: PropTypes.number,
      totalPages: PropTypes.number,
    }).isRequired,
  }).isRequired,
  onLoadMore: PropTypes.func.isRequired,
};

export default ColumnHeader;
