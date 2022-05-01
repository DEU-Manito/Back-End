package deu.manito.web.entity;


import javax.persistence.*;

@Entity
public class Grade {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "user_nickname")
    private User user;

    @Column
    private Long veryGood;

    @Column
    private Long good;

    @Column
    private Long soso;

    @Column
    private Long bad;

    @Column
    private Long veryBad;

    @Column
    private Double average;
}
