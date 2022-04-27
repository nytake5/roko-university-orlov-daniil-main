import React, { Component } from 'react'
import NoteItem from "../NoteItem/NoteItem";

const NotesList = (props) => {

    return (
        <div className='notes__list'>
            <h1 style={{textAlign: 'center', color: '#CCCCCC'}}>
                {props.title}
            </h1>
                {props.notes.map((note) =>
                        <NoteItem number={note.id} note={note} key={note.id} setIsChange={props.setIsChange}/>
                )}
        </div>
    );
};
export default NotesList