import React, { Component } from 'react'
import classes from  "./NewspaperForm.module.css"
import MyModal from '../../UI/MyModal/MyModal';

const NewspaperDetails = ({newspaper, setVisible}) => {
    return (        
        <MyModal visible={true} setVisible={setVisible}>
            <div className={classes.NewspaperForm}>
                <h1>Newspaper Details</h1>
                <label for="title"> 
                    <strong>Title</strong>: {newspaper.title}
                </label>    
                <label for="pageCount"> 
                    <strong>Page count</strong>: {newspaper.pageCount}
                </label>
                <label for="placeOfPublication"> 
                    <strong>Place of publication</strong>: {newspaper.placeOfPublication}
                </label>
                <label for="publisher"> 
                    <strong>Publisher</strong>: {newspaper.publisher}
                </label>
                <label for="yearOfPublication"> 
                    <strong>Year of publication</strong>: {newspaper.yearOfPublication}
                </label>
                <label for="issn"> 
                    <strong>ISSN</strong>: {newspaper.issn == null ? "Noone" : newspaper.issn}
                </label>
                <label for="issueNumber"> 
                    <strong>Issue number</strong>: {newspaper.issueNumber}
                </label>
                <label for="decsription"> 
                    <strong>Description</strong>: {newspaper.description}
                </label>        
            </div>       
        </MyModal>
    )
}

export default NewspaperDetails