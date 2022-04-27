import React, { Component, useEffect, useState } from 'react';
import BookService from '../../../API/BookService';
import BookDetails from '../../CreateNote/BookForm/BookDetails';
import classes from './NoteItem.module.css'
import NewspaperDetails from '../../CreateNote/NewspaperForm.jsx/NewspaperDetails';
import NewspaperService from '../../../API/NewspaperService';
import PatentDetails from '../../CreateNote/PatentForm/PatentDetails';
import PatentService from '../../../API/PatentService';
import BookUpdate from '../../CreateNote/BookForm/BookUpdate';
import NewspaperUpdate from '../../CreateNote/NewspaperForm.jsx/NewspaperUpdate';
import PatentUpdate from '../../CreateNote/PatentForm/PatentUpdate';

const NoteItem = (props) => {

    const [modalBookDet, setmodalBookDet] = useState(false);
    const [modalBookUpdate, setmodalBookUpdate] = useState(false);
    const [book, setBook] = useState(null);

    const [modalNewspaperDet, setmodalNewspaperDet] = useState(false);
    const [modalNewspaperUpdate, setmodalNewspaperUpdate] = useState(false);
    const [newspaper, setNewspaper] = useState(null);

    const [modalPatentDet, setmodalPatentDet] = useState(false);
    const [modalPatentUpdate, setmodalPatentUpdate] = useState(false);
    const [patent, setPatent] = useState(null);


    const switchToTypeForUpdate = (note) => {
        switch(note.notesType){
            case "Book":
                BookService.getDetailsForBook(note.id).then((data) => {
                    setBook(data);
                    setmodalBookUpdate(true);
                })
                break;
            case "Newspaper":
                NewspaperService.getDetailsForNewspaper(note.id).then((data) => {
                    setNewspaper(data);
                    setmodalNewspaperUpdate(true);
                })
                break;
            case "Patent":
                PatentService.getDetailsForPatent(note.id).then((data) => {
                    setPatent(data);
                    setmodalPatentUpdate(true);
                })
                break;
        }        
    }

    const switchToTypeForDelete = (note) => {
        switch(note.notesType){
            case "Book":
                BookService.deleteBook(note.id);
                break;
            case "Newspaper":
                NewspaperService.deleteNewspaper(note.id);
                break;
            case "Patent":
                PatentService.deletePatent(note.id);
                break;
        }       
        console.log(localStorage.getItem('access_token'))
        props.setIsChange(true);
    }

    const switchToTypeForDetails = (note) =>{
        switch(note.notesType){ 
            case "Book":
                BookService.getDetailsForBook(note.id).then((data) => {
                    setBook(data);
                    setmodalBookDet(true);
                })
                break;
            case "Newspaper":
                NewspaperService.getDetailsForNewspaper(note.id).then((data) => {
                    setNewspaper(data);
                    setmodalNewspaperDet(true);
                })
                break;
            case "Patent":
                PatentService.getDetailsForPatent(note.id).then((data) => {
                    setPatent(data);
                    setmodalPatentDet(true);
                })
                break;
        }
    }

    return (    
        <div className={classes.note}>
            {modalBookDet && <BookDetails book={book} setVisible={setmodalBookDet}/>}
            {modalNewspaperDet && <NewspaperDetails newspaper={newspaper} setVisible={setmodalNewspaperDet}/>}
            {modalPatentDet && <PatentDetails patent={patent} setVisible={setmodalPatentDet}/>}

            {modalBookUpdate && <BookUpdate book={book} setVisible={setmodalBookUpdate} />}
            {modalNewspaperUpdate && <NewspaperUpdate newspaper={newspaper} setVisible={setmodalNewspaperUpdate} />}
            {modalPatentUpdate && <PatentUpdate patent={patent} setVisible={setmodalPatentUpdate} />}

            <div className={classes.note__content}>
                <strong>{props.number}. {props.note.title}</strong>
                <div className='classes.info'>   
                    {props.note.getInfo}
                </div>  
            </div>
            <div className={classes.note__func} >
                <div className= {classes.note__details} onClick={switchToTypeForDetails.bind(null, props.note)}>
                    <svg width="36" height="36" viewBox="0 0 36 36" fill="0F292F" xmlns="http://www.w3.org/2000/svg">
                        <path d="M32 6H4C3.46957 6 2.96086 6.21071 2.58579 6.58579C2.21071 6.96086 2 7.46957 2 8V28C2 28.5304 2.21071 29.0391 2.58579 29.4142C2.96086 29.7893 3.46957 30 4 30H32C32.5304 30 33.0391 29.7893 33.4142 29.4142C33.7893 29.0391 34 28.5304 34 28V8C34 7.46957 33.7893 6.96086 33.4142 6.58579C33.0391 6.21071 32.5304 6 32 6V6ZM32 28H4V8H32V28Z" fill="#14A098"/>
                        <path d="M9 14H27C27.2652 14 27.5196 13.8946 27.7071 13.7071C27.8946 13.5196 28 13.2652 28 13C28 12.7348 27.8946 12.4804 27.7071 12.2929C27.5196 12.1054 27.2652 12 27 12H9C8.73478 12 8.48043 12.1054 8.29289 12.2929C8.10536 12.4804 8 12.7348 8 13C8 13.2652 8.10536 13.5196 8.29289 13.7071C8.48043 13.8946 8.73478 14 9 14V14Z" fill="#14A098"/>
                        <path d="M9 18H27C27.2652 18 27.5196 17.8946 27.7071 17.7071C27.8946 17.5196 28 17.2652 28 17C28 16.7348 27.8946 16.4804 27.7071 16.2929C27.5196 16.1054 27.2652 16 27 16H9C8.73478 16 8.48043 16.1054 8.29289 16.2929C8.10536 16.4804 8 16.7348 8 17C8 17.2652 8.10536 17.5196 8.29289 17.7071C8.48043 17.8946 8.73478 18 9 18V18Z" fill="#14A098"/>
                        <path d="M9 22H19C19.2652 22 19.5196 21.8946 19.7071 21.7071C19.8946 21.5196 20 21.2652 20 21C20 20.7348 19.8946 20.4804 19.7071 20.2929C19.5196 20.1054 19.2652 20 19 20H9C8.73478 20 8.48043 20.1054 8.29289 20.2929C8.10536 20.4804 8 20.7348 8 21C8 21.2652 8.10536 21.5196 8.29289 21.7071C8.48043 21.8946 8.73478 22 9 22V22Z" fill="#14A098"/>
                    </svg>
                </div>
                <div className={classes.note__update} onClick={switchToTypeForUpdate.bind(null, props.note)}>
                    <svg width="36" height="36" viewBox="0 0 96 96" fill="0F292F" xmlns="http://www.w3.org/2000/svg">
                        <path d="M12 69V84H27L71.24 39.76L56.24 24.76L12 69ZM82.84 28.16C84.4 26.6 84.4 24.08 82.84 22.52L73.48 13.16C71.92 11.6 69.4 11.6 67.84 13.16L60.52 20.48L75.52 35.48L82.84 28.16Z" fill="#14A098"/>
                    </svg>
                </div>
                <div className={classes.note__delete} onClick={switchToTypeForDelete.bind(null, props.note)}>
                    <svg width="36" height="36" viewBox="0 0 96 96" fill="#0F292F" xmlns="http://www.w3.org/2000/svg">
                        <path d="M24 76C24 80.4 27.6 84 32 84H64C68.4 84 72 80.4 72 76V28H24V76ZM33.84 47.52L39.48 41.88L48 50.36L56.48 41.88L62.12 47.52L53.64 56L62.12 64.48L56.48 70.12L48 61.64L39.52 70.12L33.88 64.48L42.36 56L33.84 47.52ZM62 16L58 12H38L34 16H20V24H76V16H62Z" fill="#14A098"/>
                    </svg>
                </div>
            </div>
        </div>
    );
};

export default NoteItem;