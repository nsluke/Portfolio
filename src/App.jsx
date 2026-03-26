import Hero from './components/Hero'
import Marquee from './components/Marquee'
import Projects from './components/Projects'
import Socials from './components/Socials'
import Footer from './components/Footer'
import './App.css'

function App() {
  return (
    <div className="site">
      <Hero />
      <Marquee text="Swift - Objective-C - Typescript - GDScript - Python - HTML/CSS - JavaScript - Vue - React - SwiftUI - UIKit - Git - Firebase - Xcode - Node.js - "/>
      <Projects />
      <Socials />
      <Footer />
    </div>
  )
}

export default App
