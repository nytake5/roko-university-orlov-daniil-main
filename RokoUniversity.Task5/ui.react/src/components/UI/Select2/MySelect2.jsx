import React, { Component } from 'react';
import Select from 'react-select';
import makeAnimated from 'react-select/animated';

const animatedComponents = makeAnimated();

const MySelect2 = ({options}) => {
    return (
        <Select
            closeMenuOnSelect={false}
            components={animatedComponents}
            defaultValue="Author"
            isMulti
            options={options}
        />
    )
}

export default MySelect2