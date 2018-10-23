import React, { Component, Fragment } from 'react'
import PropTypes from 'prop-types'

class Counter extends Component {
  state = {
    counter: this.props.initialValue || 0,
  }

  decrement = () => {
    this.setState(({ counter }) => ({ counter: counter - 1 }))
  }

  increment = () => {
    this.setState(({ counter }) => ({ counter: counter + 1 }))
  }

  render() {
    return (
      <Fragment>
        <button id="decrement" type="button" onClick={this.decrement} />
        <p>Current value: {this.state.counter}</p>
        <button id="increment" type="button" onClick={this.increment} />
      </Fragment>
    )
  }
}

Counter.propTypes = {
  initialValue: PropTypes.number,
}

export default Counter
