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
      <Marquee text="Software Engineer — iOS Developer — Builder —" />
      <Projects />
      <Socials />
      <Footer />
    </div>
  )
}

export default App
