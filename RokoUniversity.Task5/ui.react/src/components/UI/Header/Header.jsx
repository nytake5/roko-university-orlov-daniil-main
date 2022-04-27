import React, { Component, useState} from 'react';
import LoginForm from '../../Authentication/LoginForm';
import AuthorForm from '../../CreateNote/AuthorForm/AuthorForm';
import BookForm from '../../CreateNote/BookForm/BookForm';
import NewspaperForm from '../../CreateNote/NewspaperForm.jsx/NewspaperForm';
import PatentForm from '../../CreateNote/PatentForm/PatentForm'
import MyModal from '../MyModal/MyModal';
import classes from './Header.module.css'

const Header = () => {
  const [modalBookCreate, setmodalBookCreate] = useState(false);
  const [modalNewspaperCreate, setmodalNewspaperCreate] = useState(false);
  const [modalPatentCreate, setmodalPatentCreate] = useState(false);
  const [modalAuthorCreate, setmodalAuthorCreate] = useState(false);
  const [modalLogin, setmodalLogin] = useState(false);

  const Logout = () => {
    localStorage.removeItem("access_token");
    localStorage.removeItem("userName")
    window.location.reload();
  }

  return (
    <header className={classes.header}>
          <h1>Library</h1>
          <nav>
          <div className={classes.nav__function}>
              <div className='nav__item'>
                <button onClick={() => setmodalBookCreate(true)}>Create Book</button>
                <MyModal visible={modalBookCreate} setVisible={setmodalBookCreate}>
                  <BookForm setVisible={setmodalBookCreate}/>
                </MyModal>
              </div>
              <div className='nav__item'>
                <button onClick={() => setmodalNewspaperCreate(true)}>Create Newpspaper</button>
                <MyModal visible={modalNewspaperCreate} setVisible={setmodalNewspaperCreate}>
                  <NewspaperForm setVisible={setmodalNewspaperCreate}/>
                </MyModal>
              </div>
              <div className='nav__item'>
                <button onClick={() => setmodalPatentCreate(true)}>Create Patent</button>
                <MyModal visible={modalPatentCreate} setVisible={setmodalPatentCreate}>
                  <PatentForm setVisible={setmodalPatentCreate}/>
                </MyModal>
              </div>
              <div className='nav__item'>
                <button onClick={() => setmodalAuthorCreate(true)}>Create Author</button>
                <MyModal visible={modalAuthorCreate} setVisible={setmodalAuthorCreate}>
                  <AuthorForm setVisible={setmodalNewspaperCreate}/>
                </MyModal>
              </div>
            <a>Users</a>
          </div>
          {
          localStorage.getItem("userName") == null ?
          <div className={classes.nav__function}>
            <div className='nav__item'>
              <button onClick={() => setmodalLogin(true)}>SignIn</button>
              <MyModal visible={modalLogin} setVisible={setmodalLogin} >
                <LoginForm setVisible={setmodalLogin}/>
              </MyModal>
            </div>
            <a>SignUp</a>
          </div>
          : 
          <div className={classes.nav__identity}>
            <span>{localStorage.getItem("userName")}</span>
            <span onClick={() => Logout()}>LogOut</span>
          </div>
          }
          </nav>
    </header>
  )
}

export default Header;