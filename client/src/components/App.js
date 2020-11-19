import { Router } from '@reach/router'

import Container from './Container'
import Navigation from './Navigation'
import Home from './Home'
import Create from './Create'

const App = () => {
  return (
    <Container>
      <Navigation />
      <Router>
        <Home path="/" />
        <Create path="create" />
      </Router>
    </Container>
  )
}

export default App
