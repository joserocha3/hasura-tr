import styled from '@emotion/styled'

const Wrapper = styled.div`
  max-width: 800px;
  margin: auto;
  padding: 24px;
`

const Spacing = styled.div`
  padding: 24px;
  background: white;
  border-radius: 5px;
  box-shadow: 3px 6px 11px 0px rgba(50, 50, 50, 0.28);
`

const Container = ({ children }) => {
  return (
    <Wrapper>
      <Spacing>{children}</Spacing>
    </Wrapper>
  )
}

export default Container
