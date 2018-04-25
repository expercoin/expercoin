import TurbolinksAdapter from 'vue-turbolinks';
import Vue from 'vue/dist/vue.esm';
import Hello from '../../app/javascript/hello.vue';
import  {  shallow } from '@vue/test-utils'

describe('Hello.vue', function () {
  it('is vue', () => {
    const wrapper = shallow(Hello)
    expect(wrapper.isVueInstance()).toBeTruthy()
  })
});

describe('RegExp', function(){
  it('should match', function(){
    expect('string').toMatch(new RegExp('^string$'));
  })
});