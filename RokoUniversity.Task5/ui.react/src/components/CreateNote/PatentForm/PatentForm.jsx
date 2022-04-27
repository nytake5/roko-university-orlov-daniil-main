import React, { Component, useState, useEffect } from 'react';
import MyButton from '../../UI/Button/MyButton';
import MyInput from '../../UI/Input/MyInput'
import classes from  "./PatentForm.module.css"
import SelectWithAuthors from '../../Authors/SelectWithAuthors';
import PatentService from '../../../API/PatentService';

const PatentForm = (props) => {
    const [title, setTitle] = useState('');
    const [description, setDescription] = useState(null);
    const [pageCount, setPageCount] = useState();
    const [placeOfPublication, setPlaceOfPublication] = useState('');
    const [dateOfApplicationSubmission, setDateOfApplicationSubmission] = useState();
    const [dateOfPublication, setDateOfPublication] = useState();
    const [number, SetNumber] = useState(null);
    const [selectedAuthors, setSelectedAuthors] = useState([]);

    async function addNewPatent(e){
        e.preventDefault()
        const patent = {
            "id": 0,
            "title": title, 
            "description": description,
            "pageCount": pageCount,
            "placeOfPublication": placeOfPublication,
            "dateOfApplicationSubmission": dateOfApplicationSubmission,
            "dateOfPublication": dateOfPublication,
            "number": number,
            "authors" : selectedAuthors.map((author) => {
                return {
                    "firstName" : author.split("/")[1],
                    "lastName" : author.split("/")[0],
                }
            })
        }
        try {
            await PatentService.createPatent(patent)
            setTitle('')
            setDescription('')
            setPageCount('')
            setPlaceOfPublication('')
            setDateOfApplicationSubmission('')
            SetNumber('')
            setSelectedAuthors([])
            setDateOfPublication('')
            props.setVisible(false)
        }
        catch(error){
            alert(error)
        }
        
    }

    return (
        <div className={classes.PatentForm}>
            <h1>Create Patent</h1>
            <MyInput 
                value={title} 
                type='text' 
                required
                onChange={e => setTitle(e.target.value)}
                placeholder="Patent name"    
            />
            <MyInput 
                value={pageCount} 
                type='text' 
                required
                onChange={e => setPageCount(e.target.value)}
                placeholder="Page count"    
            />
            <MyInput 
                value={dateOfApplicationSubmission} 
                type='date'
                required 
                onChange={e => setDateOfApplicationSubmission(e.target.value)}
                placeholder="Date  of application submission"    
            />
            <MyInput 
                value={placeOfPublication} 
                type='text'
                required 
                onChange={e => setPlaceOfPublication(e.target.value)}
                placeholder="Place of publication"    
            />
            <MyInput 
                value={dateOfPublication} 
                type='date'
                required 
                onChange={e => setDateOfPublication(e.target.value)}
                placeholder="Date of publication"    
            /> 
            <MyInput 
                value={number} 
                type='text' 
                onChange={e => SetNumber(e.target.value)}
                placeholder="Number"   
            />
            <MyInput 
                value={description} 
                type='text' 
                onChange={e => setDescription(e.target.value)}
                placeholder="Description"   
            />
            <SelectWithAuthors
                handleChange = {setSelectedAuthors}   
            />
            <MyButton onClick={addNewPatent}>Create Patent</MyButton> 
        </div>
    )
}

export default PatentForm