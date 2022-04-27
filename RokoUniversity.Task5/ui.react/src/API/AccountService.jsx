import React, { Component, useContext} from 'react'
import axios from 'axios';

export class AccountService {
    static async Login(login, password){
        try {
            const responce = await axios.post("https://localhost:5001/Account", JSON.stringify({
                'login': login,
                'password': password,
                }),
                {
                    headers: {
                    'Content-Type':'application/json',
                }}
                
            );
            console.log(responce);
            localStorage.setItem('access_token', responce.data.access_token);
            localStorage.setItem('userName', responce.data.username);
            console.log(true);
            return true;
        }
        catch (error){  
            console.log(false);
            return false;
        }
    }

}

export default AccountService;