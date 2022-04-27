import React, { Component, useState } from 'react'
import AuthorService from '../../../API/AuthorService'
import MyButton from '../../UI/Button/MyButton'
import MyInput from '../../UI/Input/MyInput'
import classes from  "./AuthorForm.module.css"

const AuthorForm = () => {
    const [firstName, setFirstName] = useState('');
    const [lastName, setLastName] = useState('');
    
    async function addNewAuthor(e) {
        e.preventDefault();

        const author = {
            "id" : 0,
            "firstName" : firstName,
            "lastName" : lastName,
        };

        await AuthorService.createAuthor(author)

        setFirstName('');
        setLastName('');    
        
        window.location.reload();
    }

    return (
        <div className={classes.AuthorForm}>
            <h1>Create Author</h1>
            <MyInput 
                value={firstName} 
                type='text' 
                required
                onChange={e => setFirstName(e.target.value)}
                placeholder="Fist name"    
            />
            <MyInput 
                value={lastName} 
                type='text' 
                required
                onChange={e => setLastName(e.target.value)}
                placeholder="Last name"    
            />
            <MyButton onClick={addNewAuthor}>Create Author</MyButton> 
        </div>
        )
}

export default AuthorForm