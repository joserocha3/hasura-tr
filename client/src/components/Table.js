import styled from '@emotion/styled'

const StyledTable = styled.table`
  border-spacing: 0;
  border: 1px solid #afafafaf;
  border-radius: 5px;
  width: 100%;

  tr {
    :last-child {
      td {
        border-bottom: 0;
      }
    }
  }

  th,
  td {
    margin: 0;
    padding: 0.5rem;
    border-bottom: 1px solid #afafafaf;
    border-right: 1px solid afafafaf;

    :last-child {
      border-right: 0;
    }
  }
`

const TableHeader = styled.th`
  text-align: left;
`

const Table = ({ data = [] }) => {
  return (
    <StyledTable>
      <thead>
        <tr>
          <TableHeader>ID</TableHeader>
          <TableHeader>Name</TableHeader>
        </tr>
      </thead>
      <tbody>
        {data.map(artist => (
          <tr key={artist.ArtistId}>
            <td>{artist.ArtistId}</td>
            <td>{artist.Name}</td>
          </tr>
        ))}
      </tbody>
    </StyledTable>
  )
}

export default Table
