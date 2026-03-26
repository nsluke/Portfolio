import { useState } from 'react'
import './Projects.css'

const projects = [
  {
    name: 'Claudius',
    description: 'A Claude-powered iOS assistant',
    tech: 'Swift',
    url: 'https://github.com/nsluke/Claudius',
  },
  {
    name: 'Lazer Dragon Workout Experience',
    description: 'A HIIT Timer app designed & built from scratch',
    tech: 'Swift',
    url: 'https://github.com/nsluke/Lazer-Dragon-Workout-Experience',
  },
  {
    name: 'Manadrain',
    description: 'Mana pool management application',
    tech: 'TypeScript',
    url: 'https://github.com/nsluke/manadrain',
  },
  {
    name: 'Planechase Bot',
    description: 'Discord bot for Magic: The Gathering Planechase',
    tech: 'Python',
    url: 'https://github.com/nsluke/Planechase-Bot',
  },
  {
    name: 'PushPush',
    description: 'Push notification experimentation platform',
    tech: 'HTML',
    url: 'https://github.com/nsluke/PushPush',
  },
  {
    name: 'Treachery',
    description: 'Multiplayer hidden-role game for iOS',
    tech: 'Swift',
    url: 'https://github.com/paintedlabs/Treachery-FrontEnd',
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
