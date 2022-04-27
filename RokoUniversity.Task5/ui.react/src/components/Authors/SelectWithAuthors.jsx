import React, { Component, useEffect, useState } from 'react'
import AuthorService from '../../API/AuthorService';
import Multiselect from 'multiselect-react-dropdown';

const SelectWithAuthors = ({handleChange, authorsOldparam}) => {
    const [selectedOptions, setSelectedOptions] = useState([]);
    const [authors, setAuthors] = useState([]);

    function setOLD() {
        const temp = []
        for(let i in authorsOldparam) {
            temp.push(
                {
                    "name" : authorsOldparam[i].lastName + " " +  authorsOldparam[i].firstName[0],
                    "id" :  authorsOldparam[i].lastName + "/" +  authorsOldparam[i].firstName,
                }
            )
        }
        return temp;
    }

    useEffect(() => {
        AuthorService.getAll().then(data => {   
            setAuthors(data);
        });
        setSelectedOptions(setOLD())
    }, []) 

    useEffect(() => {
        handleChange(selectedOptions)
    }, [selectedOptions])

    useEffect(() => {
        handleChange(selectedOptions)
    }, authorsOldparam)


    return (
        <div className='Selector'>
            <Multiselect
                className='multiselect' 
                onSelect={(e) => {
                    setSelectedOptions(e.map(item => item.id));
                }}
                onRemove={(e) => {
                    setSelectedOptions(e.map(item => item.id));
                }}
                displayValue ="name"
                selectedValues ={setOLD()}
                  options={authors.map((author) => {
                    return {
                        "name" : author.lastName + " " + author.firstName[0],
                        "id" : author.lastName + "/" + author.firstName,
                    }}) 
                }
                placeholder="Select Authors"
                closeIcon='circle'
                style={
                    {
                        chips: {background: "#cb2d6f", border:  "1px solid #666"}, 
                        searchBox: {border: "1px solid #666", color: "#501f3a"},
                        optionContainer: {border: "1px solid"},
                        option: {color: "#CCCCCC"},
                    }
                }
            />
        </div>
    );
}

export default SelectWithAuthors