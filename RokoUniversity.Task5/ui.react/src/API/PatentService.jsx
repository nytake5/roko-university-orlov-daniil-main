import React, { Component } from 'react'
import axios from 'axios';

class PatentService {

    static async getDetailsForPatent(id){
        const response = await axios.options(`https://localhost:5001/Patent?id=${id}`);
        return response.data;
    }

    static async deletePatent(id){
        const response = await axios.delete(`https://localhost:5001/Patent?id=${id}`, {
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('access_token')
            }
        });
        return response;
    }

    static async createPatent(patent){
        const response = await axios.post('https://localhost:5001/Patent', patent, {
            headers: {
                'Content-Type':'application/json',
                'Authorization': 'Bearer ' + localStorage.getItem('access_token')
            }
        });
        return response;
    }
    
    static async updatePatent(patent){
        const response = await axios.put('https://localhost:5001/Patent', patent, {
            headers: {
                'Content-Type':'application/json',
                'Authorization': 'Bearer ' + localStorage.getItem('access_token')
            }
        });
        return response;
    }
}

export default PatentService;