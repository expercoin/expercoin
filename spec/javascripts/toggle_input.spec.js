import toggleInput from '../../app/javascript/components/toggleInput.vue';
import  {  shallow } from '@vue/test-utils'

describe('toggleInput.vue', function () {
  it('is vue', () => {
    const wrapper = shallow(toggleInput)
    expect(wrapper.isVueInstance()).toBeTruthy()
  })
});

describe('toggleInput.vue', function () {
  it('is vue', () => {
    const wrapper = shallow(toggleInput)
    console.log(wrapper)
    debugger;
    expect(wrapper.trigger('button')).toBeTruthy()
  })
});