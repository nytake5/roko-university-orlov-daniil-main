import React, { Component } from 'react';
import MyModal from '../../UI/MyModal/MyModal';
import classes from './PatentForm.module.css';
import AuthorListGet from '../../Authors/AuthorListGet';

const PatentDetails = ({patent, setVisible}) => {
    return (
        <MyModal visible={true} setVisible={setVisible}>
        <div className={classes.PatentForm}>
            <h1>Patent Details</h1>
            <label for="title"> 
                <strong>Title</strong>: {patent.title}
            </label>    
            <label for="pageCount"> 
                <strong>Page count</strong>: {patent.pageCount}
            </label>
            <label for="placeOfPublication"> 
                <strong>Place of publication</strong>: {patent.placeOfPublication}
            </label>
            <label for="dateOfPublication"> 
                <strong>Date of publication</strong>: {patent.dateOfPublication}
            </label>
            <label for="dateOfApplicationSubmission"> 
                <strong>Date of application submission</strong>: {patent.dateOfApplicationSubmission}
            </label>
            <label for="number"> 
                <strong>Number</strong>: {patent.number}
            </label>
            <label for="decsription"> 
                <strong>Description</strong>: {patent.description}
            </label>        
            <AuthorListGet authors={patent.authors}/>
        </div>       
    </MyModal>
    )
}

export default PatentDetails