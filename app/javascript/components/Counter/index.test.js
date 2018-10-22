import Counter from ".";

describe("Dumb Counter component", () => {
  let wrapper

  beforeEach(() => {
    wrapper = mount(<Counter />)
  })

  describe('state', () => {
    it("accepts an initial counter value as props", () => {
      const wrapper = mount(<Counter initialValue={1} />)
  
      expect(wrapper.state("counter")).toEqual(1);
    });

    it("defaults the initial counter value to 0", () => {
      expect(wrapper.state('counter')).toEqual(0)
    })
  })

  it("increments the counter value on button click", () => {
    wrapper.find("#increment").simulate("click");

    expect(wrapper.state("counter")).toEqual(1);
  });

  it("decrements the counter value on button click", () => {
    wrapper.find('#decrement').simulate('click')

    expect(wrapper.state("counter")).toEqual(-1)
  })
});
