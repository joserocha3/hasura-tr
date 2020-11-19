import { Link } from '@reach/router'
import styled from '@emotion/styled'

const StyledNav = styled.nav`
  padding: 8px 0;
  margin-bottom: 8px;
`

const StyledList = styled.ul`
  padding: 0;
  margin: 0;
  list-style-type: none;
  display: flex;
`

const StyledItem = styled.li`
  a {
    padding: 8px;
    text-decoration: none;
    color: #000;

    :first-child {
      padding-left: 0;
      margin-right: 8px;
    }
  }
`

const Navigation = () => {
  return (
    <StyledNav>
      <StyledList>
        <StyledItem>
          <Link to="/">Home</Link>
        </StyledItem>
        <StyledItem>
          <Link to="create">Create</Link>
        </StyledItem>
      </StyledList>
    </StyledNav>
  )
}

export default Navigation
