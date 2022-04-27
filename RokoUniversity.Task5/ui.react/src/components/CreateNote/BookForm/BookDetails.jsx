import React, { Component } from 'react';
import classes from  "./BookForm.module.css";
import MyModal from '../../UI/MyModal/MyModal';
import cl from '../../UI/MyModal/MyModal.module.css'
import AuthorListGet from '../../Authors/AuthorListGet';

const BookDetails = ({book, setVisible}) => {  
    return (    
        <MyModal visible={true} setVisible={setVisible}>
            <div className={classes.BookForm}>
                <h1>Book Details</h1>
                <label for="title"> 
                    <strong>Title</strong>: {book.title}
                </label>    
                <label for="pageCount"> 
                    <strong>Page count</strong>: {book.pageCount}
                </label>
                <label for="placeOfPublication"> 
                    <strong>Place of publication</strong>: {book.placeOfPublication}
                </label>
                <label for="publisher"> 
                    <strong>Publisher</strong>: {book.publisher}
                </label>
                <label for="yearOfPublication"> 
                    <strong>Year of publication</strong>: {book.yearOfPublication}
                </label>
                <label for="isbn"> 
                    <strong>ISBN</strong>: {book.isbn == null ? "Noone" : book.isbn}
                </label>
                <label for="decsription"> 
                    <strong>Description</strong>: {book.description}
                </label>        
                <AuthorListGet authors={book.authors}/>
            </div>       
        </MyModal>
    ) 
}

export default BookDetails