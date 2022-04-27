import React, { Component } from 'react'
import axios from 'axios';

class NewspaperService {

    static async getDetailsForNewspaper(id){
        const response = await axios.options(`https://localhost:5001/Newspaper?id=${id}`);
        return response.data;   
    }   

    static async deleteNewspaper(id){
        const response = await axios.delete(`https://localhost:5001/Newspaper?id=${id}`, {
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('access_token')
            }
        })
        return response;
    }

    static async createNewspaper(newspaper){
        console.log(newspaper)
        const response = await axios.post('https://localhost:5001/Newspaper', JSON.stringify(newspaper), {
            headers: {
                'Content-Type':'application/json',
                'Authorization': 'Bearer ' + localStorage.getItem('access_token')
            }
        })  
        return response;
    }
    
    static async updateNewspaper(newspaper){
        const response = await axios.put('https://localhost:5001/Newspaper', newspaper, {
            headers:{
                'Content-Type':'application/json',
                'Authorization': 'Bearer ' + localStorage.getItem('access_token')
            }
        })
        return response;
    }
}

export default NewspaperService;