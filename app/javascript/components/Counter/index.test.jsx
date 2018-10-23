import Counter from '.'

const findCounterValue = wrapper => wrapper.find('[data-test="counter-value"]')

describe('Dumb Counter component', () => {
  let wrapper
  let counterValue

  beforeEach(() => {
    wrapper = mount(<Counter />)
    counterValue = findCounterValue(wrapper)
  })

  describe('state', () => {
    it('accepts an initial counter value as props', () => {
      wrapper = mount(<Counter initialValue={1} />)

      expect(wrapper).toHaveState('counter', 1)
      expect(findCounterValue(wrapper)).toHaveText('1')
    })

    it('defaults the initial counter value to 0', () => {
      expect(wrapper).toHaveState('counter', 0)
      expect(counterValue).toHaveText('0')
    })
  })

  it('increments the counter value on button click', () => {
    wrapper.find('#increment').simulate('click')

    expect(counterValue).toHaveText('1')
  })

  it('decrements the counter value on button click', () => {
    wrapper.find('#decrement').simulate('click')

    expect(counterValue).toHaveText('-1')
  })
})
