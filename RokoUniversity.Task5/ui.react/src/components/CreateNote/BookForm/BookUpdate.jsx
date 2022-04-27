import React, { Component, useState } from 'react';
import MyModal from '../../UI/MyModal/MyModal';
import MyInput from '../../UI/Input/MyInput';
import MyButton from '../../UI/Button/MyButton';
import SelectWithAuthors from '../../Authors/SelectWithAuthors';
import classes from  "./BookForm.module.css"
import BookService from '../../../API/BookService';

const BookUpdate = (props) => {
    const [title, setTitle] = useState(props.book.title);
    const [description, setDescription] = useState(props.book.description);
    const [pageCount, setPageCount] = useState(props.book.pageCount);
    const [placeOfPublication, setPlaceOfPublication] = useState(props.book.placeOfPublication);
    const [publisher, setPublisher] = useState(props.book.publisher);
    const [yearOfPublication, setYearOfPublication] = useState(props.book.yearOfPublication);
    const [isbn, setIsbn] = useState(props.book.isbn);
    const [selectedAuthors, setSelectedAuthors] = useState(props.book.authors);

    async function UpdateBook(e){
        e.preventDefault()
            const newBook = {
            "id": props.book.id,  
            "title": title, 
            "description": description,
            "pageCount": pageCount,
            "placeOfPublication": placeOfPublication,
            "publisher": publisher,
            "yearOfPublication": yearOfPublication,
            "isbn": isbn,
            "authors" : setAuthors()
        }
        try {
            await BookService.updateBook(newBook);
            props.setVisible(false);
        }
        catch(error){
            alert(error);
        }
    }

    function setAuthors(){
        const temp = []
        console.log(selectedAuthors)
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

    return (
        <MyModal visible={true} setVisible={props.setVisible}>
            <div className={classes.BookForm}>
            <h1>Update Book</h1>
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
                authorsOldparam = {props.book.authors}
            />  
            <MyButton onClick={UpdateBook}>Update Book</MyButton> 
            </div>
        </MyModal>
    )
  
}

export default BookUpdate