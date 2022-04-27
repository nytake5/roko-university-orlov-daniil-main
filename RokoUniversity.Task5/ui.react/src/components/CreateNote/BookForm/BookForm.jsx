import React, { Component, useState, useEffect } from 'react';
import MyButton from '../../UI/Button/MyButton';
import MyInput from '../../UI/Input/MyInput'
import classes from  "./BookForm.module.css"
import SelectWithAuthors from '../../Authors/SelectWithAuthors';
import BookService from '../../../API/BookService';

const BookForm = (props) => {
    const [title, setTitle] = useState('');
    const [description, setDescription] = useState(null);
    const [pageCount, setPageCount] = useState();
    const [placeOfPublication, setPlaceOfPublication] = useState('');
    const [publisher, setPublisher] = useState('');
    const [yearOfPublication, setYearOfPublication] = useState();
    const [isbn, setIsbn] = useState(null);
    const [selectedAuthors, setSelectedAuthors] = useState('');

    async function addNewBook(e) {
        e.preventDefault()
        const book = {
            "id": 0,
            "title": title, 
            "description": description,
            "pageCount": pageCount,
            "placeOfPublication": placeOfPublication,
            "publisher": publisher,
            "yearOfPublication": yearOfPublication,
            "isbn": isbn,
            "authors" : selectedAuthors.map((author) => {
                return {
                    "firstName" : author.split("/")[1],
                    "lastName" : author.split("/")[0],
                }
            })  
        }
        try {
            await BookService.createBook(book);
            setTitle('');
            setDescription('');
            setPageCount('');
            setPlaceOfPublication('');
            setPublisher('');
            setIsbn('');
            setSelectedAuthors([]);
            setYearOfPublication('');
            props.setVisible(false);
        }
        catch(error){
            alert(error)
        }
    }

    return (
        <div className={classes.BookForm}>
            <h1>Create Book</h1>
            <MyInput 
                value={title} 
                type='text' 
                required
                onChange={e => setTitle(e.target.value)}
                placeholder="Book name"    
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
                value={isbn} 
                type='text' 
                onChange={e => setIsbn(e.target.value)}
                placeholder="ISBN"   
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
            <MyButton onClick={addNewBook}>Create Book</MyButton> 
        </div>
    )
}

export default BookForm