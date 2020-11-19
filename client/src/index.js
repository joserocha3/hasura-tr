import React from 'react'
import ReactDOM from 'react-dom'
import { Global, css } from '@emotion/react'

import App from './components/App'

// TODO: use a theme/design system so we hardcode actual px sizes the least
// amount possible
const globalStyles = css`
  @import url('https://fonts.googleapis.com/css2?family=Lato&display=swap');

  html {
    font-family: 'Lato', sans-serif;
    font-size: 16px;
    margin: 0;
    padding: 0;
  }

  body {
    background: lightblue;
    height: 100vh;
    margin: 0;
    padding: 0;
  }
`

ReactDOM.render(
  <React.StrictMode>
    <Global styles={globalStyles} />
    <App />
  </React.StrictMode>,
  document.getElementById('root')
)
