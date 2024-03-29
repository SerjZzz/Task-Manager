import React, { useState } from 'react';
import PropTypes from 'prop-types';

import AsyncSelect from 'react-select/async';
import { FormControl, FormHelperText, InputLabel } from '@material-ui/core';

import UsersRepository from 'repositories/UsersRepository';
import UserPresenter from 'presenters/UserPresenter';

import useStyles from './useStyles';

function UserSelect({
  error,
  label,
  isDisabled,
  isRequired,
  onChange,
  value,
  helperText,
}) {
  const [isFocused, setFocus] = useState(false);
  const styles = useStyles();

  const OPTIONS_LOADING_SORT = 'first_name ASC';

  const handleLoadOptions = (inputValue) =>
    UsersRepository.index({
      q: {
        firstNameOrLastNameCont: inputValue,
        s: OPTIONS_LOADING_SORT,
      },
      page: 1,
      perPage: 99,
    }).then(({ data }) => data.items);

  return (
    <FormControl
      margin="dense"
      disabled={isDisabled}
      focused={isFocused}
      error={error}
      required={isRequired}
    >
      <InputLabel shrink>{label}</InputLabel>
      <div className={styles.select}>
        <AsyncSelect
          cacheOptions
          loadOptions={handleLoadOptions}
          defaultOptions
          getOptionLabel={(user) => UserPresenter.fullName(user)}
          getOptionValue={(user) => UserPresenter.id(user)}
          isDisabled={isDisabled}
          defaultValue={value}
          onChange={onChange}
          onFocus={() => setFocus(true)}
          onBlur={() => setFocus(false)}
          menuPortalTarget={document.body}
          styles={{ menuPortal: (base) => ({ ...base, zIndex: 9999 }) }}
        />
      </div>
      {helperText && <FormHelperText>{helperText}</FormHelperText>}
    </FormControl>
  );
}

UserSelect.propTypes = {
  error: PropTypes.bool,
  label: PropTypes.string.isRequired,
  isDisabled: PropTypes.bool,
  isRequired: PropTypes.bool,
  onChange: PropTypes.func.isRequired,
  value: UserPresenter.shape(),
  helperText: PropTypes.arrayOf(PropTypes.shape({})),
};

UserSelect.defaultProps = {
  error: false,
  isDisabled: false,
  isRequired: true,
  value: null,
  helperText: null,
};

export default UserSelect;
