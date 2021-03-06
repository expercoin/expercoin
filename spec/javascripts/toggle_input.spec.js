import Vue from 'vue';
import toggleInput from '../../app/javascript/components/toggleInput.vue';
import  {  shallow, mount } from '@vue/test-utils';
import sinon from 'sinon';

describe('toggleInput.vue', function () {
  it('is vue', () => {
    const wrapper = shallow(toggleInput)
    expect(wrapper.isVueInstance()).toBeTruthy()
  })
});

describe('Methods', () => {
  const vueApp = new Vue(toggleInput)
  const wrapper = mount(toggleInput)

  it('toggle - should be a function', () => {
    expect(typeof wrapper.vm.toggle).toBe('function')
  });

  it('toggle - should change active true to false', () => {
    vueApp.active = true
    vueApp.toggle()
    expect(vueApp.active).toBe(false)
  });

  it('toggle - should change active false to true', () => {
    vueApp.active = false
    vueApp.toggle()
    expect(vueApp.active).toBe(true)
  });
});

describe('clicking on hide hides button hide', function () {
  it('hides button hide', () => {
    const clickHandler = sinon.stub();
    const wrapper = mount(toggleInput,{
      propsData: { clickHandler }
    });
    const buttonHide = wrapper.find('[aria-label="hide"]');
    buttonHide.trigger('click');
    expect(buttonHide.isVisible()).toBe(false);
  })
});

describe('clicking on show hides button show', function () {
  it('hides button show', () => {
    const clickHandler = sinon.stub();
    const wrapper = mount(toggleInput, {
      propsData: { clickHandler }
    });
    wrapper.vm.active = false;
    const buttonShow = wrapper.find('[aria-label="show"]');
    buttonShow.trigger('click');
    expect(buttonShow.isVisible()).toBe(false);
  })
});

describe('clicking on hide hides input', function () {
  it('hides input', () => {
    const clickHandler = sinon.stub();
    const wrapper = mount(toggleInput,{
      propsData: { clickHandler }
    });
    const buttonHide = wrapper.find('[aria-label="hide"]');
    buttonHide.trigger('click');
    const input = wrapper.find('[aria-label="input"]');
    expect(input.isVisible()).toBe(false);
  })
});

describe('clicking on show shows input', function () {
  it('shows input', () => {
    const clickHandler = sinon.stub();
    const wrapper = mount(toggleInput, {
      propsData: { clickHandler }
    });
    wrapper.vm.active = false;
    const buttonShow = wrapper.find('[aria-label="show"]');
    buttonShow.trigger('click');
    const input = wrapper.find('[aria-label="input"]');
    expect(input.isVisible()).toBe(true);
  })
});
