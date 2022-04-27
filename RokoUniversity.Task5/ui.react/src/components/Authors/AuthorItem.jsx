import React, { Component } from 'react'

const AuthorItem = ({author}) => {
    return (
        <div className='Author'>
            <div className='author__content'>
                <strong>{author.authorId}. {author.lastName} {author.firstName[0]}.</strong>
            </div>
        </div>
    )
}

export default AuthorItem