import { SdpRplLayer } from '@dpc-sdp/ripple-sdp-projen-config'
const project = new SdpRplLayer({
  name: '@dpc-sdp/ripple-test-layer',
  defaultReleaseBranch: 'main',
  rippleVersion: '2.52.1',
  addCypress: true
})
project.synth()
