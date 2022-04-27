import React, { Component } from 'react'
import AuthorItem from './AuthorItem';

const AuthorsList = ({authors}) => {
    return (
        <div className='authors__list'>
            {authors.map((author) =>
                <AuthorItem author={author} key={author.id}/>
            )}
        </div>
    );
}

export default AuthorsList