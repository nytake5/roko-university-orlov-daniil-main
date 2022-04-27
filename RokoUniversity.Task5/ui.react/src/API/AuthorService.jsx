import React, { Component } from 'react';
import axios from 'axios';


class AuthorService {
    static async getAll() {
        const response = await axios.get('https://localhost:5001/Author');
        return response.data;
    }

    static async createAuthor(author){
        console.log(author)
        const response = await axios.post('https://localhost:5001/Author', author, {
            headers: {
                'Content-Type':'application/json',
                'Authorization': 'Bearer' + localStorage.getItem('access_token')
            }
        })
        return response;
    }
}

export default AuthorService