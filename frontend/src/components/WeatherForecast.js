// src/components/WeatherForecast.js
import React, { useState, useEffect } from 'react';
import axios from 'axios';

const WeatherForecast = () => {
    const [forecast, setForecast] = useState([]);

    useEffect(() => {
        // Realiza una solicitud GET a la API
        axios.get('http://localhost:5000/weatherforecast')
            .then(response => {
                setForecast(response.data);
            })
            .catch(error => {
                console.error('Hubo un error!', error);
            });
    }, []);

    return (
        <div>
            <h1>Weather Forecast</h1>
            <ul>
                {forecast.map((item) => (
                    <li key={item.date}>
                        <strong>{item.date}</strong>: {item.temperatureC}°C, {item.summary}
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default WeatherForecast;
