import { useState } from 'react'
import { useMutation } from 'react-query'
import styled from '@emotion/styled'

import Input from './Input'
import Button from './Button'

const insertArtist = async artistName => {
  const response = await fetch(
    `${process.env.REACT_APP_BASE_ENDPOINT}/artists`,
    {
      method: 'POST',
      body: JSON.stringify({ artistName }),
      headers: {
        'Content-Type': 'application/json',
      },
    }
  )
  return response.json()
}

const ErrorMessage = styled.p`
  color: red;
  margin: 0;
  padding: 0;
  padding-top: 8px;
`

const Message = styled.p`
  color: green;
  margin: 0;
  padding: 0;
  padding-top: 8px;
`

// TODO: use a library like react-hook-form for form state management, this
// this trivial example does not need it

const Create = () => {
  const [artistName, setArtistName] = useState('')
  const [artistNameError, setArtistNameError] = useState()
  const [message, setMessage] = useState()
  const [mutate, { isLoading, error }] = useMutation(insertArtist, {
    onSuccess: ({ Name }) => {
      setArtistName('')
      setMessage(
        `Artist ${Name} has been created. Go ahead and create another!`
      )
    },
  })

  const handleOnSubmit = async e => {
    e.preventDefault()

    setMessage()
    setArtistNameError()

    const value = artistName.trim()

    if (!value) {
      setArtistNameError('Required')
    } else {
      setArtistNameError()
      mutate(value)
    }
  }

  const handleOnChange = async e => {
    setArtistNameError()
    setMessage()
    setArtistName(e.target.value)
  }

  return (
    <>
      <h2>Create an Artist</h2>
      <form onSubmit={handleOnSubmit}>
        <Input
          name="artistName"
          placeholder="Enter artist name"
          value={artistName}
          onChange={handleOnChange}
          error={artistNameError}
        />
        <Button type="submit" disabled={isLoading}>
          {isLoading ? 'Creating...' : 'Create Artist'}
        </Button>
      </form>
      {error && <ErrorMessage>{error.toString()}</ErrorMessage>}
      {message && <Message>{message}</Message>}
    </>
  )
}

export default Create
