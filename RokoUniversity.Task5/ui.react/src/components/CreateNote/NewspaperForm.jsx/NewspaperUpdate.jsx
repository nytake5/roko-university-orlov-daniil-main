import React, { Component, useState, useEffect } from 'react';
import NewspaperService from '../../../API/NewspaperService';
import MyButton from '../../UI/Button/MyButton';
import MyInput from '../../UI/Input/MyInput'
import MyModal from '../../UI/MyModal/MyModal';
import classes from  "./NewspaperForm.module.css"

const NewspaperUpdate = (props) => {
    const [title, setTitle] = useState(props.newspaper.title);
    const [description, setDescription] = useState(props.newspaper.description);
    const [pageCount, setPageCount] = useState(props.newspaper.pageCount);
    const [placeOfPublication, setPlaceOfPublication] = useState(props.newspaper.placeOfPublication);
    const [publisher, setPublisher] = useState(props.newspaper.publisher);
    const [yearOfPublication, setYearOfPublication] = useState(props.newspaper.yearOfPublication);
    const [issn, setIssn] = useState(props.newspaper.issn);
    const [issueNumber, setIssueNumber] = useState(props.newspaper.issueNumber);


    async function UpdateNewspaper(e){
        e.preventDefault()
        const newNewspaper = {
            "id": props.newspaper.id,
            "title": title, 
            "description": description,
            "pageCount": pageCount,
            "placeOfPublication": placeOfPublication,
            "publisher": publisher,
            "yearOfPublication": yearOfPublication,
            "issn": issn,
            "issueNumber": issueNumber,
        }
        try {
            await NewspaperService.updateNewspaper(newNewspaper);
            props.setVisible(false);
        }
        catch(error){
            alert(error);
        }
    }

    return (
        <MyModal visible={true} setVisible={props.setVisible}>
            <div className={classes.NewspaperForm}>
                <h1>Update Newspaper</h1>
                <MyInput 
                    value={title} 
                    type='text' 
                    required
                    onChange={e => setTitle(e.target.value)}
                    placeholder="Title"    
                />
                <MyInput 
                    value={pageCount} 
                    type='text' 
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
                    type='text'
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
                    type='text' 
                    onChange={e => setIssueNumber(e.target.value)}
                    placeholder="IssueNumber"   
                />
                <MyInput 
                    value={description} 
                    type='text' 
                    onChange={e => setDescription(e.target.value)}
                    placeholder="Description"   
                />
                <MyButton onClick={UpdateNewspaper}>Update Newpsaper</MyButton> 
            </div>
        </MyModal>
    )
}

export default NewspaperUpdate