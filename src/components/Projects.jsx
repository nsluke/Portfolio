import { useState } from 'react'
import './Projects.css'

const projects = [
  {
    name: 'Treachery',
    description: 'Multiplayer MTG Variant for iOS',
    tech: 'Swift',
    url: 'https://github.com/paintedlabs/Treachery-FrontEnd',
  },
    {
    name: 'The Lazer Dragon Workout Experience',
    description: 'Think you can take on the Lazer Dragon?',
    tech: 'Swift',
    url: 'https://github.com/nsluke/Lazer-Dragon-Workout-Experience',
  },
  {
    name: 'Claudius',
    description: 'Track Your Claude usage, right on your menu bar. ',
    tech: 'Swift',
    url: 'https://github.com/nsluke/Claudius',
  },
  {
    name: 'Manadrain',
    description: 'Stash your favorite cards for later.',
    tech: 'TypeScript',
    url: 'https://github.com/nsluke/manadrain',
  },
  {
    name: 'Planechase Bot',
    description: 'Discord bot for playing Planechase',
    tech: 'Python',
    url: 'https://github.com/nsluke/Planechase-Bot',
  },
  {
    name: 'PushPush',
    description: 'The First game I ever made. Aged like fine wine.',
    tech: 'Objective-C',
    url: 'https://github.com/nsluke/PushPush',
  },
  {
    name: 'Bling My Deck',
    description: 'Find the most expensive printing of every card in your MTG deck',
    tech: 'TypeScript',
    url: 'https://github.com/nsluke/blingmydeck',
  },
]

function Projects() {
  const [hovered, setHovered] = useState(null)

  return (
    <section className="projects" id="projects">
      <div className="projects-header">
        <span className="section-label">Selected Work</span>
        <span className="project-count">{projects.length} Projects</span>
      </div>
      <div className="projects-list">
        {projects.map((project, i) => (
          <a
            key={project.name}
            href={project.url}
            target="_blank"
            rel="noopener noreferrer"
            className={`project-row ${hovered !== null && hovered !== i ? 'dimmed' : ''}`}
            onMouseEnter={() => setHovered(i)}
            onMouseLeave={() => setHovered(null)}
          >
            <div className="project-index">
              {String(i + 1).padStart(2, '0')}
            </div>
            <div className="project-info">
              <h3 className="project-name">{project.name}</h3>
              <p className="project-desc">{project.description}</p>
            </div>
            <div className="project-tech">{project.tech}</div>
            <div className="project-arrow">-&gt;</div>
          </a>
        ))}
      </div>
    </section>
  )
}

export default Projects
