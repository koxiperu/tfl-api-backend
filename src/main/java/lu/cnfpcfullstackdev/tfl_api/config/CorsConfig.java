package lu.cnfpcfullstackdev.tfl_api.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Collections;
import java.util.List;

@Configuration
public class CorsConfig {

    private static final Logger logger = LoggerFactory.getLogger(CorsConfig.class);

    @Value("${app.cors.allowed-origins:http://localhost:5173,http://localhost:3000}")
    private List<String> allowedOrigins;

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        logger.info("Configuring CORS. Allowed origins from config: {}", allowedOrigins);

        CorsConfiguration configuration = new CorsConfiguration();

        // !!! --- TEMPORARY DEBUGGING STEP --- !!!
        // This allows all origins. It is INSECURE and must be removed.
        // We are using this only to confirm if the CORS filter is working at all.
        logger.warn("!!! INSECURE CORS CONFIGURATION: Allowing all origins for debugging. !!!");
        configuration.setAllowedOriginPatterns(Collections.singletonList("*"));
        // !!! --- END TEMPORARY DEBUGGING STEP --- !!!

        // The original, secure configuration is commented out below:
        // configuration.setAllowedOriginPatterns(allowedOrigins);

        configuration.setAllowedMethods(List.of("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"));
        configuration.setAllowedHeaders(List.of("Authorization", "Content-Type", "Accept", "Origin", "X-Requested-With"));
        configuration.setExposedHeaders(List.of("Authorization"));
        configuration.setAllowCredentials(true);
        configuration.setMaxAge(3600L);

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }
}