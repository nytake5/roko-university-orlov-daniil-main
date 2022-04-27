import React, { Component } from 'react'
import AuthorItem from './AuthorItem';
import classes from './AuthorListGet.module.css';


const AuthorListGet = (authors) => { 
    const values = Object.values(authors);
    return (
        <div className={classes.authors}> 
            <strong>Authors:</strong>
            <p>
                {values.map((author) =>
                    <AuthorItem author={author[0]} key={author[0].id}/>
                )}
            </p>
        </div>
    );
}

export default AuthorListGet