import React, { Component } from 'react'
import axios from 'axios';

class NoteService {
    static async getAll() {
        const response = await axios.get('https://localhost:5001/Notes')
        return response.data;
    }

    static async getPage(pageSize = 2, page = 1){
        const response = await axios.get(`https://localhost:5001/Notes/pageNum&pageSize?pageSize=${pageSize}&pageNum=${page}`);
        return response;
    }

    static async findByTitle(title = '', pageSize = 2, page = 1){
        const responce = await axios.get(`https://localhost:5001/Notes/title&pageNum&pageSize?title=${title}&pageSize=${pageSize}&pageNum=${page}`);
        return responce;
    }
}

export default NoteService