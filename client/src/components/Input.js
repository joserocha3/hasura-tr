import styled from '@emotion/styled'

const InputGroup = styled.div`
  margin-bottom: 8px;
  display: flex;
  flex-direction: column;
`

const StyledInput = styled.input`
  padding: 8px;
  font-size: 16px;
  border: 1px solid lightblue;
  border-radius: 5px;
  max-width: 300px;
`

const ErrorMessage = styled.span`
  color: red;
  font-size: 0.8rem;
`

const Button = ({ error, ...rest }) => {
  return (
    <InputGroup>
      <StyledInput {...rest} />
      {error && <ErrorMessage>{error}</ErrorMessage>}
    </InputGroup>
  )
}

export default Button
