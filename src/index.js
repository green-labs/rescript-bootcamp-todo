import React from 'react';
import ReactDOM from 'react-dom/client';
import { make as App } from './components/App';
import "./styles/main.css"

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
