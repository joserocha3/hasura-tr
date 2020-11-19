import styled from '@emotion/styled'

const Wrapper = styled.div`
  margin-top: 16px;
  display: flex;
  justify-content: center;
  align-items: center;
`

const Arrow = styled.button`
  padding: 8px;
  font-size: 1.5rem;
  cursor: pointer;
  background: none;
  outline: none;
  border: none;
`

const Pagination = ({
  currentPage,
  totalPages,
  incrementPage,
  decrementPage,
}) => {
  return (
    <Wrapper>
      <Arrow onClick={decrementPage} disabled={currentPage === 1}>{`<`}</Arrow>
      <span>{`${currentPage} of ${totalPages}`}</span>
      <Arrow
        onClick={incrementPage}
        disabled={currentPage >= totalPages}
      >{`>`}</Arrow>
    </Wrapper>
  )
}

export default Pagination
