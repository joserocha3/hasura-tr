import { useState } from 'react'
import { useQuery } from 'react-query'

import Table from './Table'
import Pagination from './Pagination'

const LIMIT = 10

const fetchArtists = async (key, offset = 0) => {
  const response = await fetch(
    `${process.env.REACT_APP_BASE_ENDPOINT}/artists?offset=${offset}&limit=${LIMIT}`
  )
  const data = await response.json()

  return {
    currentPage: offset / LIMIT + 1,
    totalPages: Math.ceil((data.totalCount || 0) / LIMIT),
    artists: data.artists,
  }
}

const Home = () => {
  const [offset, setOffset] = useState(0)
  const { isLoading, isError, data, error } = useQuery(
    ['artists', offset],
    fetchArtists
  )

  const incrementPage = () => {
    setOffset(offset + LIMIT)
  }

  const decrementPage = () => {
    setOffset(offset - LIMIT)
  }

  if (isLoading) {
    return <span>Loading...</span>
  }

  if (isError) {
    return <span>Error: {error.message}</span>
  }

  return (
    <>
      <h2>Hello, Artists</h2>
      <Table data={data?.artists} />
      <Pagination
        currentPage={data?.currentPage}
        totalPages={data?.totalPages}
        incrementPage={incrementPage}
        decrementPage={decrementPage}
      />
    </>
  )
}

export default Home
