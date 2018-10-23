import React, { Component, Fragment } from 'react'
import PropTypes from 'prop-types'

class Counter extends Component {
  state = {
    // eslint-disable-next-line react/destructuring-assignment
    counter: this.props.initialValue,
  }

  decrement = () => {
    this.setState(({ counter }) => ({ counter: counter - 1 }))
  }

  increment = () => {
    this.setState(({ counter }) => ({ counter: counter + 1 }))
  }

  render() {
    const { counter } = this.state

    return (
      <Fragment>
        <button id="decrement" type="button" onClick={this.decrement} />
        <p>
          Current value: <span data-test="counter-value">{counter}</span>
        </p>
        <button id="increment" type="button" onClick={this.increment} />
      </Fragment>
    )
  }
}

Counter.propTypes = {
  initialValue: PropTypes.number,
}

Counter.defaultProps = {
  initialValue: 0,
}

export default Counter
