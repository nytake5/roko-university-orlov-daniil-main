import React, { Component } from 'react'
import axios from 'axios';

class BookService {
    static async getDetailsForBook(id){
        const response = await axios.options(`https://localhost:5001/Book?id=${id}`);
        return response.data;       
    }

    static async deleteBook(id){
        const response  = await axios.delete(`https://localhost:5001/Book?id=${id}`, {
            headers: {
                'Authorization': 'Bearer' + localStorage.getItem('access_token')
            }
        })

        return response;
    }

    static async createBook(book){
        console.log(book)
        const response = await axios.post('https://localhost:5001/Book', JSON.stringify(book), {
            headers: {
                'Content-Type':'application/json',
                'Authorization': 'Bearer ' + localStorage.getItem('access_token')
            }
        })
        return response;
    }
    
    static async updateBook(book){
        const response = await axios.put('https://localhost:5001/Book', book, {
            headers: {
                'Content-Type':'application/json',
                'Authorization': 'Bearer ' + localStorage.getItem('access_token')
            }
        })
        return response;
    }
}

export default BookService;