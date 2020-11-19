import styled from '@emotion/styled'

const StyledButton = styled.button`
  padding: 8px;
  font-size: 16px;
  border-radius: 5px;
  outline: none;
  border: none;
  cursor: pointer;
`

const Button = props => {
  return <StyledButton {...props} />
}

export default Button
