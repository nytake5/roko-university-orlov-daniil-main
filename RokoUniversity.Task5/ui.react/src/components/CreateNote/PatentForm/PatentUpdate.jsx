import React, { Component, useState, useEffect } from 'react';
import MyButton from '../../UI/Button/MyButton';
import MyInput from '../../UI/Input/MyInput'
import classes from  "./PatentForm.module.css"
import SelectWithAuthors from '../../Authors/SelectWithAuthors';
import MyModal from '../../UI/MyModal/MyModal';
import PatentService from '../../../API/PatentService';

const PatentUpdate = (props) => {
    const [title, setTitle] = useState(props.patent.title);
    const [description, setDescription] = useState(props.patent.description);
    const [pageCount, setPageCount] = useState(props.patent.pageCount);
    const [placeOfPublication, setPlaceOfPublication] = useState(props.patent.placeOfPublication);
    const [dateOfApplicationSubmission, setDateOfApplicationSubmission] = useState(convertDate(props.patent.dateOfApplicationSubmission));
    const [dateOfPublication, setDateOfPublication] = useState(convertDate(props.patent.dateOfPublication));
    const [number, SetNumber] = useState(props.patent.number);
    const [selectedAuthors, setSelectedAuthors] = useState(props.patent.selectedAuthors);

    async function UpdatePatent(e) {
        e.preventDefault()
        const newPatent = {
            "id": props.patent.id,
            "title": title, 
            "description": description,
            "pageCount": pageCount,
            "placeOfPublication": placeOfPublication,
            "dateOfApplicationSubmission": dateOfApplicationSubmission,
            "dateOfPublication": dateOfPublication,
            "number": number,
            "authors" : setAuthors()
        }
        try {
            await PatentService.updatePatent(JSON.stringify(newPatent));
            props.setVisible(false);
        }
        catch(error){
            alert(error);
        }
    }
    
    function setAuthors(){
        const temp = []
        for(let i in selectedAuthors) {
            temp.push(
                {
                    "firstName" : selectedAuthors[i].id.split("/")[1],
                    "lastName" : selectedAuthors[i].id.split("/")[0],
                }
            )
        }
        return temp;
    }

    function convertDate(date){
        date = date.split("T");
        const [year, month, day] = date[0].split('-');
        return `${year}-${month}-${day}`;
    }

    return (
        <MyModal visible={true} setVisible={props.setVisible}>
            <div className={classes.PatentForm}>
                <h1>Update Patent</h1>
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
                    authorsOldparam = {props.patent.authors}
                />
                <MyButton onClick={UpdatePatent}>Update Patent</MyButton> 
            </div>
        </MyModal>
    )
}

export default PatentUpdate