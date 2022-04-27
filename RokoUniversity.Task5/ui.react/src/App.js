import React, { useEffect, useState, useMemo} from 'react';
import NoteService from './API/NoteService';
import './styles/style.css'; 
import Header from './components/UI/Header/Header';
import NotesList from './components/Notes/NotesList/NotesList'
import { useFetching } from './components/hooks/useFetching';
import Loader from './components/UI/Loader/Loader';
import {getPageCount, getPagesArray} from './components/utils/pages';
import MyButton from './components/UI/Button/MyButton';
import MyInput from './components/UI/Input/MyInput';

function App() {
  const [pageSize, setPageSize] = useState(2);
  const [page, setPage] = useState(1);
  const [totalPages, setTotalPages] = useState(0);
  const [searchTitle, setSearchTitle] = useState('');
  const [notes, setNotes] = useState([]);
  const [isChange, setIsChange] = useState(false);
  const [fetchNotes, isNotesLoad, notesError] = useFetching( async() => {
    const response = await selectedNotes();
    const notes = response.data.body;
    setNotes(notes);  
    const totalCount = response.data.size;
    setTotalPages(getPageCount(totalCount, pageSize))
  });

  const selectedNotes = async () =>{
    if(searchTitle === ''){
      return await NoteService.getPage(pageSize, page);
    }
    else{
      return await NoteService.findByTitle(searchTitle, pageSize, page);
    }
  }

  let pagesArray = getPagesArray(totalPages)

  useEffect(() => {
    fetchNotes()
  }, [page, searchTitle]);
  
  useEffect(() => {
    fetchNotes();
    setIsChange(false);
  }, isChange)


  return (
    <div className='AppBody'>
      <Header/>
      <div style={{display: 'block', justifyContent: 'center'}} className='container'>
        <MyInput 
          value = {searchTitle}
          onChange={e => setSearchTitle(e.target.value)}
          placeholder= "Search"
        />
        {isNotesLoad 
          ? <div style={{display: "flex", justifyContent: 'center', marginTop: 50}}><Loader/> </div>
          : <NotesList notes={notes} title={"List of notes"} setIsChange={setIsChange}/>
        }
      </div>  
      <div className='page__wrapper'>
        {pagesArray.map( p =>
          <span 
            key={p} 
            className={page === p ? 'page page__current' : 'page'}
            onClick={() => setPage(p)}
          >
            {p}
          </span>
        )}
      </div>
    </div>
    );
}

export default App;
  