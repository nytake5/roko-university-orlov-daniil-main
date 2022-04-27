import React, { Component, useState, useEffect } from 'react';
import NewspaperService from '../../../API/NewspaperService';
import MyButton from '../../UI/Button/MyButton';
import MyInput from '../../UI/Input/MyInput'
import classes from  "./NewspaperForm.module.css"

const NewspaperForm = (props) => {
    const [title, setTitle] = useState('');
    const [description, setDescription] = useState(null);
    const [pageCount, setPageCount] = useState();
    const [placeOfPublication, setPlaceOfPublication] = useState('');
    const [publisher, setPublisher] = useState('');
    const [yearOfPublication, setYearOfPublication] = useState();
    const [issn, setIssn] = useState(null);
    const [issueNumber, setIssueNumber] = useState('');

    async function  addNewNewspaper(e) {
        e.preventDefault()
        await NewspaperService.createNewspaper( {
            "id": 0,
            "title": title, 
            "description": description,
            "pageCount": pageCount,
            "placeOfPublication": placeOfPublication,
            "publisher": publisher,
            "yearOfPublication": yearOfPublication,
            "issn": issn,
            "issueNumber": issueNumber,
            "newspapersWithOtherView": []
        });
        
        try {
            setTitle('');
            setDescription('');
            setPageCount('');
            setPlaceOfPublication('');
            setPublisher('');
            setIssueNumber('');
            setIssn('');
            setYearOfPublication('');
            props.setVisible(false);
        }
        catch(error){
            alert(error)
        }
    }

    return (
        <div className={classes.NewspaperForm}>
            <h1>Create Newspaper</h1>
            <MyInput 
                value={title} 
                type='text' 
                required
                onChange={e => setTitle(e.target.value)}
                placeholder="Title"    
            />
            <MyInput 
                value={pageCount} 
                type='number' 
                required
                onChange={e => setPageCount(e.target.value)}
                placeholder="Page count"    
            />
            <MyInput 
                value={placeOfPublication} 
                type='text'
                required 
                onChange={e => setPlaceOfPublication(e.target.value)}
                placeholder="Place of publication"    
            />
            <MyInput 
                value={publisher} 
                type='text'
                required 
                onChange={e => setPublisher(e.target.value)}
                placeholder="Publisher"    
            />
            <MyInput 
                value={yearOfPublication} 
                type='number'
                required 
                onChange={e => setYearOfPublication(e.target.value)}
                placeholder="Year of publication"    
            /> 
            <MyInput 
                value={issn} 
                type='text' 
                onChange={e => setIssn(e.target.value)}
                placeholder="ISSN"   
            />
            <MyInput 
                value={issueNumber} 
                type='number' 
                onChange={e => setIssueNumber(e.target.value)}
                placeholder="IssueNumber"   
            />
            <MyInput 
                value={description} 
                type='text' 
                onChange={e => setDescription(e.target.value)}
                placeholder="Description"   
            />
            <MyButton onClick={addNewNewspaper}>Create Newpsaper</MyButton> 
        </div>
    )
}

export default NewspaperForm